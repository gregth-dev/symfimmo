<?php

namespace App\DataFixtures;

use App\Entity\Property;
use Doctrine\Bundle\FixturesBundle\Fixture;
use Doctrine\Persistence\ObjectManager;
use Faker\Factory as faker;

class PropertyFixture extends Fixture
{
    public function load(ObjectManager $manager)
    {
        $faker = faker::create('fr_FR');
        for ($i = 0; $i < 100; $i++) {
            $property = new Property();
            $property
                ->setTitle($faker->words(3, true))
                ->setDescription($faker->sentences(3, true))
                ->setSurface($faker->numberBetween(20, 350))
                ->setRooms($faker->numberBetween(1, 10))
                ->setBedrooms($faker->numberBetween(1, 4))
                ->setFloor($faker->numberBetween(0, 15))
                ->setPrice($faker->numberBetween(50000, 1000000))
                ->setHeat($faker->numberBetween(0, count(Property::HEAT) - 1))
                ->setCity($faker->city)
                ->setAddress($faker->address)
                ->setPostalCode($faker->postcode)
                ->setSold(false)
                ->setCreatedAt($faker->dateTimeBetween('-6days', 'now', 'Europe/Paris'));
            $manager->persist($property);
        }
        $manager->flush();
    }
}
