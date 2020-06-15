<?php

namespace App\Form;

use App\Entity\Option;
use App\Entity\Property;
use Symfony\Bridge\Doctrine\Form\Type\EntityType;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\Extension\Core\Type\ChoiceType;
use Symfony\Component\Form\Extension\Core\Type\FileType;
use Symfony\Component\Form\Extension\Core\Type\HiddenType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\Form\FormEvent;
use Symfony\Component\Form\FormEvents;
use Symfony\Component\OptionsResolver\OptionsResolver;

class PropertyType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options)
    {

        $builder
            ->add('title', null, ['label' => 'Titre'])
            ->add('description', null, ['label' => 'Description'])
            ->add('surface', null, ['label' => 'Surface'])
            ->add('rooms', null, ['label' => 'Nombre de pièces'])
            ->add('bedrooms', null, ['label' => 'Chambres'])
            ->add('floor', null, ['label' => 'Nombre d\'étage'])
            ->add('price', null, ['label' => 'Prix'])
            ->add('heat', ChoiceType::class, [
                'label' => 'Type de chauffage',
                'choices' => array_flip(Property::HEAT)
            ])
            ->add('options', EntityType::class, [
                'class' => Option::class,
                'choice_label' => 'name',
                'multiple' => true,
                'required' => false
            ])
            ->add('pictureFiles', FileType::class, [
                'required' => false,
                'multiple' => true,
                'label' => 'Ajouter une image',
                'label_attr' => ['data-browse' => 'Parcourir']

            ])
            ->add('city', null, ['label' => 'Ville'])
            ->add('address', null, ['label' => 'Adresse'])
            ->add('postal_code', null, ['label' => 'Code postal'])
            ->add('lat', HiddenType::class)
            ->add('lng', HiddenType::class)
            // Ajoute un champ en fonction de la création ou de l'édition.
            ->addEventListener(FormEvents::PRE_SET_DATA, function (FormEvent $event) {
                $property = $event->getData();
                $form = $event->getForm();
                if ($property->getId())
                    $form->add('sold', null, ['label' => 'Vendu']);
            });
    }

    public function configureOptions(OptionsResolver $resolver)
    {
        $resolver->setDefaults([
            'data_class' => Property::class
        ]);
    }
}
