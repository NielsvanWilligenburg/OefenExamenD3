<h1><?php echo $data['title'] ?></h1>
<hr>

<table>
    <thead>
        <tr>
            <th>Voornaam</th>
            <th>Tussenvoegsel</th>
            <th>Achternaam</th>
            <th>Aantal punten</th>
            <th>Wijzigen</th>
        </tr>
        <tbody>
            <?php echo $data['rows'] ?>
        </tbody>
    </thead>
</table>