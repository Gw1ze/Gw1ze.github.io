<?php

    //return "success"; die(); // Remove this line in live site, it is only for testing

if($_REQUEST['your_name'] == '' || $_REQUEST['your_email'] == '' || $_REQUEST['your_message'] == ''):
	return "error";
endif;

if (filter_var($_REQUEST['your_email'], FILTER_VALIDATE_EMAIL)):

      // Receiver email address (Change it to your Email ID)
//  $to = 'webmaster@funkyjunkytechies.com';
	$to = 'labudiu@gmail.com';

      // prepare header
$header = 'From: '. $_REQUEST['your_name'] . ' <'. $_REQUEST['your_email'] .'>'. "\r\n";
$header .= 'Reply-To:  '. $_REQUEST['your_name'] . ' <'. $_REQUEST['email'] .'>'. "\r\n";
      // $header .= 'Cc:  ' . 'example@domain.com' . "\r\n";
      // $header .= 'Bcc:  ' . 'example@domain.com' . "\r\n";
$header .= 'X-Mailer: PHP/' . phpversion();

      // Contact subject
$subject = "Email Form Foody HTML5 Template";

      // Contact Message
$message .= 'Name: ' . $_REQUEST['your_name'] . "\n";
$message .= 'Email: ' . $_REQUEST['your_email'] . "\n";
$message .= 'Message: '. $_REQUEST['your_message'];

      // Send contact information
$mail = mail( $to, $url , $message, $header );

return $mail ? "success" : "error";
else:
	return "error";
endif;
?>