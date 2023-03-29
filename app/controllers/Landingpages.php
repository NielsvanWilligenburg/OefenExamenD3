<?php

class Landingpages extends Controller {
    public function index() {
        $data = [
            'title' => 'Landingpages',
            'description' => 'This is the landingpages page'
        ];

        $this->view('landingpages/index', $data);
    }
}