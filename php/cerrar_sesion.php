<?php

session_start();
unset ($SESSION['password']);
session_destroy();

header('Location: ../index.html');

?>