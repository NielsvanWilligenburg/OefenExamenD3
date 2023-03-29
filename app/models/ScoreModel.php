<?php

class ScoreModel
{
    private $db;

    public function __construct()
    {
        $this->db = new Database;
    }

    public function getScoreByGroep()
    {
        $this->db->query('SELECT uits.id, pers.Voornaam, pers.Tussenvoegsel, pers.Achternaam, uits.Aantalpunten, res.Datum 
        FROM `uitslag` AS uits
        INNER JOIN `spel` AS spel ON uits.SpelId = spel.Id
        INNER JOIN `persoon` AS pers ON spel.PersoonId = pers.id
        INNER JOIN `reservering` AS res ON spel.ReserveringId = res.Id
        WHERE res.PersoonId = 4
        ORDER BY uits.Aantalpunten DESC');
        return $this->db->resultSet();
    }

    public function getScore()
    {
        $this->db->query('SELECT uits.id, pers.Voornaam, pers.Tussenvoegsel, pers.Achternaam, uits.Aantalpunten, res.Datum 
        FROM `uitslag` AS uits
        INNER JOIN `spel` AS spel ON uits.SpelId = spel.Id
        INNER JOIN `persoon` AS pers ON spel.PersoonId = pers.id
        INNER JOIN `reservering` AS res ON spel.ReserveringId = res.Id
        INNER JOIN `TypePersoon` AS typers
        ON pers.TypePersoonId = typers.Id
        WHERE typers.Naam = "Klant"
        ORDER BY uits.Aantalpunten DESC');
        return $this->db->resultSet();
    }

    public function getScoreByDate($date)
    {
        $this->db->query('SELECT uits.id, pers.Voornaam, pers.Tussenvoegsel, pers.Achternaam, uits.Aantalpunten, res.Datum 
        FROM `uitslag` AS uits
        INNER JOIN `spel` AS spel ON uits.SpelId = spel.Id
        INNER JOIN `persoon` AS pers ON spel.PersoonId = pers.id
        INNER JOIN `reservering` AS res ON spel.ReserveringId = res.Id
        WHERE res.Datum = :date');
        $this->db->bind(':date', $date['date']);
        return $this->db->resultSet();
    }   

    public function getResDate() {
        $this->db->query('SELECT res.datum from reservering AS res
        WHERE res.PersoonId = 4');
        return $this->db->resultSet();
    }

    public function getScoreById($id)
    {
        $this->db->query('SELECT uitslag.id, uitslag.Aantalpunten FROM `uitslag` WHERE id = :id');
        $this->db->bind(':id', $id);
        return $this->db->single();
    }

    public function updateScore($data)
    {
        $this->db->query('UPDATE `uitslag` SET Aantalpunten = :score WHERE id = :id');
        $this->db->bind(':id', $data['id']);
        $this->db->bind(':score', $data['score']);

        if ($this->db->execute()) {
            return true;
        } else {
            return false;
        }
    }
}
