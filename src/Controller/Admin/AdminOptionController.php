<?php

namespace App\Controller\Admin;

use App\Entity\Option;
use App\Form\OptionType;
use App\Repository\OptionRepository;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\component\Routing\Annotation\Route;

class AdminOptionController extends AbstractController
{
    /**
     *@Route("/admin/option",name="admin_option_index")
     * @param OptionRepository $repository
     * @return Response
     */
    public function index(OptionRepository $repository): Response
    {
        $options = $repository->findAll();
        return $this->render('admin/option/index.html.twig', compact('options'));
    }

    /**
     *@Route("/admin/option/{id}",name="admin_option_edit", methods={"GET", "POST"})
     *@Route("/admin/option/create",name="admin_option_create")
     * @return Response
     */
    public function edit(?Option $option = null, Request $request, EntityManagerInterface $manager): Response
    {
        if (!$option)
            $option = new Option();
        $form = $this->createForm(OptionType::class, $option);
        $form->handleRequest($request);
        if ($form->isSubmitted() && $form->isValid()) {
            $message = $option->getId() ? 'Le bien a été modifié' : 'Le bien a été ajouté';
            $this->addFlash('success', $message);
            $manager->persist($option);
            $manager->flush();
            return $this->redirectToRoute('admin_option_index');
        }
        return $this->render('admin/option/edit.html.twig', [
            'option' => $option,
            'form' => $form->createView()
        ]);
    }

    /**
     *@Route("/admin/option/{id}",name="admin_option_delete", methods={"DELETE"})
     * @return Response
     */
    public function delete(Option $option, EntityManagerInterface $manager, Request $request): Response
    {
        if ($this->isCsrfTokenValid('delete' . $option->getId(), $request->request->get('_token'))) {
            $manager->remove($option);
            $manager->flush();
            $this->addFlash('success', 'Le bien a été supprimé');
        }
        return $this->redirectToRoute('admin_option_index');
    }
}
