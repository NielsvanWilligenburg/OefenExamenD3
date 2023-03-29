<h1><?php echo $data['title'] ?></h1>
<select name="Datum" id="">
    <option value="">12-023-230</option>
</select>
<hr>

<table>
    <thead>
        <tr>
            <th>Voornaam</th>
            <th>Tussenvoegsel</th>
            <th>Achternaam</th>
            <th>Aantal punten</th>
            <th>Datum</th>
            <th>Wijzigen</th>
        </tr>
        <tbody>
            <?php echo $data['rows'] ?>
        </tbody>
    </thead>
</table>