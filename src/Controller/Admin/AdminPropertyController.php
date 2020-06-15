<?php

namespace App\Controller\Admin;

use App\Entity\Property;
use App\Form\PropertyType;
use App\Repository\PropertyRepository;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\component\Routing\Annotation\Route;

class AdminPropertyController extends AbstractController
{
    /**
     *@Route("/admin",name="admin_property_index")
     * @param PropertyRepository $repository
     * @return Response
     */
    public function index(PropertyRepository $repository): Response
    {
        $properties = $repository->findAll();
        return $this->render('admin/property/index.html.twig', compact('properties'));
    }

    /**
     *@Route("/admin/property/{id}",name="admin_property_edit", methods={"GET", "POST"})
     *@Route("/admin/property/create",name="admin_property_create")
     * @return Response
     */
    public function edit(?Property $property = null, Request $request, EntityManagerInterface $manager): Response
    {
        if (!$property)
            $property = new Property();
        $form = $this->createForm(PropertyType::class, $property);
        $form->handleRequest($request);
        if ($form->isSubmitted() && $form->isValid()) {
            $message = $property->getId() ? 'Le bien a été modifié' : 'Le bien a été ajouté';
            $this->addFlash('success', $message);
            $manager->persist($property);
            $manager->flush();
            return $this->redirectToRoute('admin_property_index');
        }
        return $this->render('admin/property/edit.html.twig', [
            'property' => $property,
            'form' => $form->createView()
        ]);
    }

    /**
     *@Route("/admin/property/{id}",name="admin_property_delete", methods={"DELETE"})
     * @return Response
     */
    public function delete(Property $property, EntityManagerInterface $manager, Request $request): Response
    {
        if ($this->isCsrfTokenValid('delete' . $property->getId(), $request->request->get('_token'))) {
            $manager->remove($property);
            $manager->flush();
        }
        return $this->redirectToRoute('admin_property_index');
    }
}
