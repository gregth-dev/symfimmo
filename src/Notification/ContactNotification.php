<?php

namespace App\Notification;

use App\Entity\Contact;
use Doctrine\ORM\Query\Expr\From;
use Symfony\Bridge\Twig\Mime\TemplatedEmail;
use Symfony\Component\Mailer\MailerInterface;
use Symfony\Component\Mime\Email;
use Twig\Environment;

class ContactNotification
{

    private $mailer;

    public function __construct(MailerInterface $mailer)
    {
        $this->mailer = $mailer;
    }

    public function notify(Contact $contact)
    {
        $email = (new TemplatedEmail())
            ->from($contact->getEmail())
            ->to('gregory.thorel@live.fr')
            ->subject('Contact depuis l\'agence en ligne')
            ->htmlTemplate('emails/contact.html.twig')
            ->context(['contact' => $contact]);
        $this->mailer->send($email);
    }
}
