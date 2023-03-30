<h1><?php echo $data['title'] ?></h1>
<form action="" method="post">
    <select name="Datum" aria-placeholder="ff">
        <option disabled selected value>Datum</option>`
        <?php echo $data['dates'] ?>
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