<?php

namespace App\Entity;

use Doctrine\Common\Collections\ArrayCollection;
use Symfony\Component\Validator\Constraints as Assert;

class PropertySearch
{

    /**
     * @var int|null
     */
    private ?int $maxPrice = null;

    /**
     * @var int|null
     * @Assert\Range(min = 10,minMessage = "La surface doit être de 10 m² minimum")
     */
    private ?int $minSurface = null;

    private ArrayCollection $options;

    /**
     *
     * @var int|null
     */
    private $distance;

    /**
     *
     * @var float|null
     */
    private $lat;

    /**
     *
     * @var float|null
     */
    private $lng;


    public function __construct()
    {
        $this->options = new ArrayCollection();
    }

    /**
     * Get the value of maxPrice
     *
     * @return  int|null
     */
    public function getMaxPrice()
    {
        return $this->maxPrice;
    }

    /**
     * Set the value of maxPrice
     *
     * @param  int|null  $maxPrice
     *
     * @return  self
     */
    public function setMaxPrice($maxPrice)
    {
        $this->maxPrice = $maxPrice;

        return $this;
    }

    /**
     * Get the value of minSurface
     *
     * @return  int|null
     */
    public function getMinSurface()
    {
        return $this->minSurface;
    }

    /**
     * Set the value of minSurface
     *
     * @param  int|null  $minSurface
     *
     * @return  self
     */
    public function setMinSurface($minSurface)
    {
        $this->minSurface = $minSurface;

        return $this;
    }

    /**
     * Get the value of options
     */
    public function getOptions(): ArrayCollection
    {
        return $this->options;
    }

    /**
     * Set the value of options
     *
     * @return  self
     */
    public function setOptions(ArrayCollection $options)
    {
        $this->options = $options;

        return $this;
    }

    /**
     * Get the value of distance
     *
     * @return  int|null
     */
    public function getDistance()
    {
        return $this->distance;
    }

    /**
     * Set the value of distance
     *
     * @param  int|null  $distance
     *
     * @return  self
     */
    public function setDistance($distance)
    {
        $this->distance = $distance;

        return $this;
    }

    /**
     * Get the value of lat
     *
     * @return  float|null
     */
    public function getLat()
    {
        return $this->lat;
    }

    /**
     * Set the value of lat
     *
     * @param  float|null  $lat
     *
     * @return  self
     */
    public function setLat($lat)
    {
        $this->lat = $lat;

        return $this;
    }

    /**
     * Get the value of lng
     *
     * @return  float|null
     */
    public function getLng()
    {
        return $this->lng;
    }

    /**
     * Set the value of lng
     *
     * @param  float|null  $lng
     *
     * @return  self
     */
    public function setLng($lng)
    {
        $this->lng = $lng;

        return $this;
    }
}
