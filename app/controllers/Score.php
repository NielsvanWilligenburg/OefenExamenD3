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

        var_dump($scores);

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

        $scores = $this->scoreModel->getScore();

        $dates = $this->scoreModel->getResDate();

        var_dump($dates);

        foreach ($dates as $date) {
            $date = $date->datum;

            echo "<option value='$date'>$date</option>";
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
            'rows' => $rows
        ];

        $this->view('score/overzicht', $data);
    }

    public function update($id = null)
    {

        if ($id == null) {
            header('location: ' . URLROOT . 'score');
            exit;
        }

        $score = $this->scoreModel->getScoreById($id);

        var_dump($score);

        $this->view('score/update');
    }
}
