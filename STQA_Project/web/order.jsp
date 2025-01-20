<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Payment Page</title>
  <link href="https://fonts.googleapis.com/css?family=Roboto+Condensed:400,700" rel="stylesheet">
  <link rel="stylesheet" href="order.css">
</head>
<body>

  <div class="payment-container">
    <h1 class="payment-title">Complete Your Payment</h1>
    
    <div class="payment-summary">
      <h3>Order Summary</h3>
      <table>
        <tr>
          <td>Product:</td>
          <td>Premium Plan</td>
        </tr>
        <tr>
          <td>Price:</td>
          <td>$49.99</td>
        </tr>
        <tr>
          <td>Tax:</td>
          <td>$5.00</td>
        </tr>
        <tr>
          <td><strong>Total:</strong></td>
          <td><strong>$54.99</strong></td>
        </tr>
      </table>
    </div>
    
    <form action="/submit-payment" method="POST" class="payment-form">
      <div class="form-group">
        <label for="name">Name on Card</label>
        <input type="text" id="name" name="name" required>
      </div>
      
      <div class="form-group">
        <label for="card-number">Card Number</label>
        <input type="text" id="card-number" name="card-number" required>
      </div>
      
      <div class="form-group">
        <label for="expiry-date">Expiry Date</label>
        <input type="text" id="expiry-date" name="expiry-date" required>
      </div>
      
      <div class="form-group">
        <label for="cvv">CVV</label>
        <input type="text" id="cvv" name="cvv" required>
      </div>
      
      <button type="submit">Pay Now</button>
    </form>
  </div>

</body>
</html>
