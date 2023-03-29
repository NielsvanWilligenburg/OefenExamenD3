<?php

class Score extends Controller
{
    private $scoreModel;
    public function __construct()
    {
        $this->scoreModel = $this->model('ScoreModel');
    }

    public function index()
    {
        $scores = $this->scoreModel->getScore();

        $rows = '';

        foreach ($scores as $score) {

            $rows .= "<tr>
                        <td>$score->Voornaam</td>
                        <td>$score->Tussenvoegsel</td>
                        <td>$score->Achternaam</td>
                        <td>$score->Aantalpunten</td>
                        <td><a href='" . URLROOT . "score/update/$score->id'>Wijzigen</a></td>
                        </tr>";
        }

        $data = [
            'title' => 'Overzicht Speler',
            'rows' => $rows
        ];

        $this->view('score/index', $data);
    }

    public function overzicht()
    {

        if($_SERVER['REQUEST_METHOD'] == 'POST') {
            $_POST = filter_input_array(INPUT_POST, FILTER_SANITIZE_FULL_SPECIAL_CHARS);

            var_dump($_POST);
        }

        $scores = $this->scoreModel->getScoreByGroep();

        $dates = $this->scoreModel->getResDate();


        $RowDates = '';

        foreach ($dates as $date) {
            $date2 = date_create($date->datum);
            $result = $date2->format('d/m/Y');
            $RowDates .= "<option value='$result'>$result</option>";
        }

        $rows = '';

        foreach ($scores as $score) {

            $rows .= "<tr>
                        <td>$score->Voornaam</td>
                        <td>$score->Tussenvoegsel</td>
                        <td>$score->Achternaam</td>
                        <td>$score->Aantalpunten</td>
                        <td>$score->Datum</td>
                        </tr>";
        }

        $data = [
            'title' => 'Overzicht Uitslag',
            'rows' => $rows,
            'dates' => $RowDates
        ];

        $this->view('score/overzicht', $data);
    }

    public function update($id = null)
    {

        if ($_SERVER['REQUEST_METHOD'] == 'POST') {
            $_POST = filter_input_array(INPUT_POST, FILTER_SANITIZE_FULL_SPECIAL_CHARS);

            if ($_POST['score'] > 300) {
                echo 'Aantal punten is niet geldig, voer een waarde in kleiner of gelijk aan 300';
                header('refresh: 3; url=' . URLROOT . 'score/update/' . $id);
                exit;
            }

            // Maak een array aan met de data die in de database moet komen
            $data = [
                'id' => $id,
                'score' => $_POST['score']
            ];

            $this->scoreModel->updateScore($data);


            if ($this->scoreModel->updateScore($data)) {
                echo 'Aantal punten is gewijzigd';
                header('refresh: 3; url=' . URLROOT . 'score/');
                exit;
            } else {
                die('Er is iets fout gegaan');
            }
        }

        if ($id == null) {
            header('location: ' . URLROOT . 'score');
            exit;
        }

        $score = $this->scoreModel->getScoreById($id);

        $data = [
            'title' => 'Detail Uitslag',
            'score' => $score->Aantalpunten
        ];

        $this->view('score/update', $data);
    }
}
