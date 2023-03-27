<?php

namespace App\Controller;

use App\Entity\Fruit;
use App\Entity\Nutrition;
use Knp\Component\Pager\PaginatorInterface;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\Mailer\MailerInterface;
use Symfony\Component\Mime\Email;
use Symfony\Component\HttpClient\HttpClient;

class FruitController extends AbstractController
{
    /**
     * @Route("/", name="home")
     */
    public function allFruits(Request $request, PaginatorInterface $paginator): Response
    {
        $api_url = $this->getParameter('app.api_url') . 'all';

        if ($request->query->get('name')) {
            $api_url = $this->getParameter('app.api_url') . $request->query->get('name');
        }
        if ($request->query->get('family')) {
            $api_url = $this->getParameter('app.api_url') . 'family/' . $request->query->get('family');
        }

        $client = HttpClient::create();
        $response = $client->request('GET', $api_url);
        $statusCode = $response->getStatusCode();

        if ($statusCode === 200) {
            if ($request->query->get('name') != '') {
                $content[] = $response->toArray();
            } else {
                $content = $response->toArray();
            }
        } else {
            $content = [];
        }

        $paginatedFruits = $paginator->paginate($content, $request->query->getInt('page', 1), 5);
        return $this->render('allFruits.html.twig',
            ['fruits' => $paginatedFruits, 'page' => $request->query->getInt('page', 1)]);
    }

    /**
     * @Route("/favorite", name="favorite-fruit")
     */
    public function getFavoriteFruit(Request $request): Response
    {
        $ids = $request->query->get('ids');
        $client = HttpClient::create();
        $allFavoriteArray = array();
        $sum_nutrition = array();
        $carbohydrates = $protein = $fat = $calories = $sugar = 0;

        foreach (json_decode($ids) as $key => $id) {
            $response = $client->request(
                'GET',
                $this->getParameter('app.api_url') . $id
            );
            $statusCode = $response->getStatusCode();
            $content = $response->toArray();

            if ($statusCode === 200) {
                array_push($allFavoriteArray, $content);
                $carbohydrates = $carbohydrates + (float)$content['nutritions']['carbohydrates'];
                $protein = $protein + (float)$content['nutritions']['protein'];
                $fat = $fat + (float)$content['nutritions']['fat'];
                $calories = $calories + (float)$content['nutritions']['calories'];
                $sugar = $sugar + (float)$content['nutritions']['sugar'];
            }
        }

        return $this->render('favoriteFruits.html.twig', [
            'favorites' => $allFavoriteArray,
            'carbohydrates' => $carbohydrates,
            'protein' => $protein,
            'fat' => $fat,
            'calories' => $calories,
            'sugar' => $sugar
        ]);
    }
}
