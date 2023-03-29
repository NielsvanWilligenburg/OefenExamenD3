<h1><?php echo $data['title'] ?></h1>
<form action="" method="post">
    <select name="Datum" id="">
        <option value=""><?php echo $data['dates'] ?></option>
    </select>
    <button>Tonen</button>
</form>

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