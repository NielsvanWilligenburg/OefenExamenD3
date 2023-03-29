<?php

class ScoreModel
{
    private $db;

    public function __construct()
    {
        $this->db = new Database;
    }

    public function getScore()
    {
        $this->db->query('SELECT uits.id, pers.Voornaam, pers.Tussenvoegsel, pers.Achternaam, uits.Aantalpunten, res.Datum 
        FROM `uitslag` AS uits
        INNER JOIN `spel` AS spel ON uits.SpelId = spel.Id
        INNER JOIN `persoon` AS pers ON spel.PersoonId = pers.id
        INNER JOIN `reservering` AS res ON spel.ReserveringId = res.Id
        WHERE spel.ReserveringId = (
          SELECT spel.ReserveringId 
          FROM `spel` 
          WHERE spel.PersoonId = 4
        )
        ORDER BY uits.Aantalpunten DESC');
        return $this->db->resultSet();
    }

    public function getResDate() {
        $this->db->query('SELECT res.datum FROM `reservering` AS res
        INNER JOIN `persoon` AS pers
        ON res.PersoonId = pers.id
        WHERE pers.id = 4');
        return $this->db->resultSet();
    }

    public function getScoreById($id)
    {
        $this->db->query('SELECT uitslag.id, uitslag.Aantalpunten FROM `uitslag` WHERE id = :id');
        $this->db->bind(':id', $id);
        return $this->db->single();
    }
}
