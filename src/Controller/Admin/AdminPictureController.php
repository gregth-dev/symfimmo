<?php

namespace App\Controller\Admin;

use App\Entity\Picture;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\component\Routing\Annotation\Route;

/**
 * @Route("/admin/picture")
 */
class AdminPictureController extends AbstractController
{

    /**
     *@Route("/admin/picture/{id}",name="admin_picture_delete", methods={"DELETE"})
     * @return Response
     */
    public function delete(Picture $picture, EntityManagerInterface $manager, Request $request): Response
    {
        $propertyId = $picture->getProperty()->getId();
        if ($this->isCsrfTokenValid('delete' . $picture->getId(), $request->request->get('_token'))) {
            $manager->remove($picture);
            $manager->flush();
            $this->addFlash('success', 'La photo a été supprimée');
            return new JsonResponse(['success' => 1]);
        } else {
            return new JsonResponse(['tokenInvalid' => 1]);
        }
    }
}
