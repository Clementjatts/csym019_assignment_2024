<?php
require 'db.php';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $username = $_POST['username'];
    $password = $_POST['password'];

    // Retrieve the user from the database
    $stmt = $pdo->prepare('SELECT * FROM users WHERE username = ?');
    $stmt->execute([$username]);
    $user = $stmt->fetch(PDO::FETCH_ASSOC);

    if ($user && password_verify($password, $user['password'])) {
        // Start session and set session variables if needed
        session_start();
        $_SESSION['username'] = $username;

        // Redirect to SelectionForm.html
        header('Location: EntryForm.html');
        exit();
    } else {
        echo 'Invalid username or password!';
    }
}
?>