<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Order Placed</title>
    <style>
        body {
            margin: 0;
            padding: 0;
            background: #fffef3;
            font-family: 'Segoe UI', sans-serif;
            display: flex;
            justify-content: center;
            align-items: center;
            flex-direction: column;
            height: 100vh;
            overflow: hidden;
            position: relative;
            text-align: center;
        }

        .animation-container {
            position: relative;
        }

        .checkmark-circle {
            width: 120px;
            height: 120px;
            border-radius: 50%;
            background: #28a745;
            display: flex;
            justify-content: center;
            align-items: center;
            animation: popIn 0.4s ease-out;
            margin-bottom: 30px;
        }

        .checkmark {
            width: 60px;
            height: 30px;
            border-left: 6px solid #fff;
            border-bottom: 6px solid #fff;
            transform: rotate(-45deg);
            animation: drawCheck 0.4s 0.5s ease-out forwards;
            opacity: 0;
        }

        @keyframes popIn {
            0% { transform: scale(0); opacity: 0; }
            100% { transform: scale(1); opacity: 1; }
        }

        @keyframes drawCheck {
            to { opacity: 1; }
        }

        h1 {
            color: #28a745;
            font-size: 34px;
            margin-bottom: 10px;
        }

        p {
            font-size: 18px;
            color: #444;
            margin-bottom: 30px;
        }

        a {
            background: #ff6347;
            color: white;
            padding: 12px 24px;
            border-radius: 8px;
            text-decoration: none;
            font-weight: bold;
            font-size: 16px;
            transition: all 0.3s ease;
        }

        a:hover {
            background: #e5533d;
            transform: scale(1.05);
        }

        /* Confetti animation */
        .confetti {
            position: absolute;
            width: 10px;
            height: 10px;
            background-color: red;
            animation: confetti-fall 3s linear infinite;
            opacity: 0.8;
        }

        @keyframes confetti-fall {
            0% { transform: translateY(0) rotate(0); }
            100% { transform: translateY(100vh) rotate(720deg); }
        }
    </style>
</head>
<body>

    <!-- Confetti elements -->
    <script>
        const colors = ['#f94144', '#f3722c', '#f9844a', '#f9c74f', '#90be6d', '#43aa8b', '#577590'];
        for (let i = 0; i < 50; i++) {
            const confetti = document.createElement('div');
            confetti.classList.add('confetti');
            confetti.style.left = Math.random() * 100 + 'vw';
            confetti.style.backgroundColor = colors[Math.floor(Math.random() * colors.length)];
            confetti.style.animationDelay = (Math.random() * 2) + 's';
            document.body.appendChild(confetti);
        }
    </script>

    <div class="animation-container">
        <div class="checkmark-circle">
            <div class="checkmark"></div>
        </div>
    </div>

    <h1>Order Successfully Placed!</h1>
    <p>We’ve received your order. It’s being prepared with love ❤️</p>

    <a href="menu">Order More Delicious Food</a>

</body>
</html>
