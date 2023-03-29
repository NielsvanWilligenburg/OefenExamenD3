<?php 


class Example extends Controller {
    private $exampleModel;
    public function __construct() {
        $this->exampleModel = $this->model('ExampleModel');
    }

    public function index() {
        $data = [
            'title' => 'Example',
            'description' => 'This is the example page'
        ];

        $this->view('example/index', $data);
    }
}