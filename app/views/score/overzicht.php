<h1><?php echo $data['title'] ?></h1>
<select name="Datum" id="">
<option value="">24-03-2032</option>
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
        </tr>
        <tbody>
            <?php echo $data['rows'] ?>
        </tbody>
    </thead>
</table>