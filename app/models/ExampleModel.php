<?php 

class ExampleModel {
    private $db;

    public function __construct() {
        $this->db = new Database;
    }

    public function getExample() {
        return 'Example';
    }
}