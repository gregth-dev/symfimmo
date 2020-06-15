<?php


namespace App\Entity;

use Symfony\Component\Validator\Constraints as Assert;

class Contact
{

    /**
     *
     * @var string|null
     * @Assert\NotBlank()
     * @Assert\Length(min=2,max=50, minMessage="Le nom doit être au minimum de 2 caractères",maxMessage="Le nom doit être au maximum de 50 caractères")
     */
    private $firstName;

    /**
     *
     * @var string|null
     * @Assert\NotBlank()
     * @Assert\Length(min=2,max=50, minMessage="Le nom doit être au minimum de 2 caractères",maxMessage="Le nom doit être au maximum de 50 caractères")
     */
    private $lastName;

    /**
     *
     * @var string|null
     * @Assert\NotBlank()
     * @Assert\Regex(
     * pattern="/^\(0\)[0-9]*$/",match=false,message="Numéro de téléphone incorrect"
     * )
     */
    private $phone;

    /**
     *
     * @var string|null
     * @Assert\NotBlank()
     * @Assert\Email(message = "L'email n'est pas valide.")
     */
    private $email;

    /**
     *
     * @var string|null
     * @Assert\NotBlank()
     * @Assert\Length(min=10,minMessage="Votre message doit faire 10 caractères minimum")
     */
    private $message;

    /**
     *
     * @var Property|null
     */
    private $property;



    /**
     * Get the value of firstName
     *
     * @return  string|null
     */
    public function getFirstName()
    {
        return $this->firstName;
    }

    /**
     * Set the value of firstName
     *
     * @param  string|null  $firstName
     *
     * @return  self
     */
    public function setFirstName($firstName)
    {
        $this->firstName = $firstName;

        return $this;
    }

    /**
     * Get the value of lastName
     *
     * @return  string|null
     */
    public function getLastName()
    {
        return $this->lastName;
    }

    /**
     * Set the value of lastName
     *
     * @param  string|null  $lastName
     *
     * @return  self
     */
    public function setLastName($lastName)
    {
        $this->lastName = $lastName;

        return $this;
    }

    /**
     * Get pattern="/[0-9]{10}",match=false,message="Numéro de téléphone incorrect"
     *
     * @return  string|null
     */
    public function getPhone()
    {
        return $this->phone;
    }

    /**
     * Set pattern="/[0-9]{10}",match=false,message="Numéro de téléphone incorrect"
     *
     * @param  string|null  $phone  pattern="/[0-9]{10}",match=false,message="Numéro de téléphone incorrect"
     *
     * @return  self
     */
    public function setPhone($phone)
    {
        $this->phone = $phone;

        return $this;
    }

    /**
     * Get the value of email
     *
     * @return  string|null
     */
    public function getEmail()
    {
        return $this->email;
    }

    /**
     * Set the value of email
     *
     * @param  string|null  $email
     *
     * @return  self
     */
    public function setEmail($email)
    {
        $this->email = $email;

        return $this;
    }

    /**
     * Get the value of message
     *
     * @return  string|null
     */
    public function getMessage()
    {
        return $this->message;
    }

    /**
     * Set the value of message
     *
     * @param  string|null  $message
     *
     * @return  self
     */
    public function setMessage($message)
    {
        $this->message = $message;

        return $this;
    }

    /**
     * Get the value of property
     *
     * @return  Property|null
     */
    public function getProperty()
    {
        return $this->property;
    }

    /**
     * Set the value of property
     *
     * @param  Property|null  $property
     *
     * @return  self
     */
    public function setProperty($property)
    {
        $this->property = $property;

        return $this;
    }
}
