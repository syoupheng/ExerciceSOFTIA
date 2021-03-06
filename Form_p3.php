<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="stylesheet_SOFTIA.css"/>
        <meta charset="UTF-8">
        <meta name="author" content="Syou-P'heng Do">
        <meta name="description" content="Cette application permet à l'entreprise FormationPlus de générer des attestations de manière automatique.">
        <meta name="keywords" content="FormationPlus">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Créer une attestation | FormationPlus</title>
    </head>
    <body>
        <header>
        </header>  
        <main>
            <div class="flexdiv">
                <form id="form" action="Form_p1.php" method="POST">
                    <h1>Créer une attestation</h1>
                    <?php include "RegisterData.php" ?>
                    <br><br>
                    <div class="flexdiv">
                        <input type="submit" id="send" value="Retour">
                    </div>
                </form>
            </div>    
        </main>
    </body>
</html>