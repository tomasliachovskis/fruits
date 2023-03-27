<?php

namespace App\Command;

use App\Entity\Fruit;
use App\Entity\Nutrition;
use DateTimeImmutable;
use Symfony\Component\Console\Command\Command;
use Symfony\Component\Console\Input\InputInterface;
use Symfony\Component\Console\Output\OutputInterface;
use Symfony\Component\HttpClient\HttpClient;
use Doctrine\ORM\EntityManagerInterface;

class GetFruitsCommand extends Command
{
    protected static $defaultName = 'app:get-fruits-api';

    public function __construct(EntityManagerInterface $entityManager)
    {
        $this->entityManager = $entityManager;
        parent::__construct();
    }

    protected function execute(InputInterface $input, OutputInterface $output): int
    {
        $client = HttpClient::create();

        $response = $client->request(
            'GET',
            'https://fruityvice.com/api/fruit/all'
        );

        $statusCode = $response->getStatusCode();
        $content = $response->toArray();

        if (count($content) > 0 && $statusCode === 200) {
            foreach ($content as $fruitData) {
                $fruit = new Fruit();

                $fruit->setName($fruitData['name']);
                $fruit->setGenus($fruitData['genus']);
                $fruit->setFamily($fruitData['family']);
                $fruit->setOrderF($fruitData['order']);
                $fruit->setCreatedAt(new DateTimeImmutable("now"));
                $fruit->setUpdatedAt(new DateTimeImmutable("now"));

                $nutrition = new Nutrition();
                $nutrition->setCarbohydrates($fruitData['nutritions']['carbohydrates']);
                $nutrition->setProtein($fruitData['nutritions']['protein']);
                $nutrition->setFat($fruitData['nutritions']['fat']);
                $nutrition->setCalories($fruitData['nutritions']['calories']);
                $nutrition->setSugar($fruitData['nutritions']['sugar']);
                $nutrition->setCreatedAt(new DateTimeImmutable("now"));
                $nutrition->setUpdatedAt(new DateTimeImmutable("now"));

                $fruit->setNutrition($nutrition);

                $this->entityManager->persist($fruit);
                $this->entityManager->flush();
            }
        }

        return Command::SUCCESS;
    }
}

