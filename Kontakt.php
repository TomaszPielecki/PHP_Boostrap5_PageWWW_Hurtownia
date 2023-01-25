<?php require('Components/Head.php'); ?>

<body>

<div class='container'>
    <!-- navbar -->
    <?php require('Components/Navbar.php'); ?>
    <?php require('Components/Formularz.php'); ?>
    <?php
    $errorMessage = null;
    $successMessage = null;

    if ($_POST) {
        $name = isset($_POST['name']) ? filter_var($_POST['name'], FILTER_SANITIZE_STRING) : null;
        $email = isset($_POST['email']) ? filter_var($_POST['email'], FILTER_VALIDATE_EMAIL) : null;
        $message = htmlspecialchars($_POST['message']);

        if (empty($name) || empty($email) || empty($message)) {
            $errorMessage = 'Wypełnij wszystkie pola!';
        }

        if (is_null($errorMessage)) {
            mail(
                'twoj-adres@email.pl',
                'Formularz kontaktowy',
                "Treść wiadomości: $message \n\n Imię: $name \n\n Adres e-mail: $email",
                "From: $name <$email>"
            );

            $successMessage = 'Wiadomość została wysłana';
        }
    }
    ?>
    <!-- body formularz-->
    <div class="container">
        <div class="row">
            <div class="col col-md-6 offset-md-3">

                <h3 class="my-5">Formularz kontaktowy</h3>

                <?php if ($errorMessage) : ?>
                    <div class="alert alert-danger"><?php echo $errorMessage; ?></div>
                <?php endif; ?>

                <?php if ($successMessage) : ?>
                    <div class="alert alert-success"><?php echo $successMessage; ?></div>
                <?php endif; ?>

                <form method="POST">
                    <div class="mb-3">
                        <label for="name" class="form-label">Imię</label>
                        <input type="text" class="form-control" id="name" name="name">
                    </div>

                    <div class="mb-3">
                        <label for="email" class="form-label">Adres e-mail</label>
                        <input type="email" class="form-control" id="email" name="email">
                    </div>

                    <div class="mb-3">
                        <label for="message" class="form-label">Treść wiadomości</label>
                        <textarea class="form-control" id="message" name="message" rows="3"></textarea>
                    </div>

                    <div class="mb-3">
                        <input class="btn btn-primary" type="submit" value="Wyślij formularz">
                    </div>
                </form>

            </div>
        </div>
    </div>
    <!-- body Formularz-->
    <!-- footer -->
    <?php require('Components/Footer.php'); ?>

</div>
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
        integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js"
        integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js"
        integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
        crossorigin="anonymous"></script>
</body>
</html>