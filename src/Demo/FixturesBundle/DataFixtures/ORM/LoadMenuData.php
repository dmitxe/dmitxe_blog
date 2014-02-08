<?php

namespace Demo\FixturesBundle\ORM;

use Doctrine\Common\DataFixtures\FixtureInterface;
use Doctrine\Common\DataFixtures\OrderedFixtureInterface;
use Doctrine\Common\Persistence\ObjectManager;
use Symfony\Component\DependencyInjection\ContainerAware;
use SmartCore\Module\Menu\Entity\Group;
use SmartCore\Module\Menu\Entity\Item;

class LoadMenuData extends ContainerAware implements FixtureInterface, OrderedFixtureInterface
{
    /**
     * {@inheritDoc}
     */
    public function load(ObjectManager $manager)
    {
        $user_id = 1;
        $em = $this->container->get('doctrine.orm.default_entity_manager');

        $menu_group = New Group();
        $menu_group->setCreateByUserId($user_id)
            ->setName('Главное меню')
            ->setPosition(0)
        ;
        $manager->persist($menu_group);
        $manager->flush();

        $root_folder = $em->getRepository('SmartCore\Bundle\CMSBundle\Entity\Folder')->findOneBy(['title'=>'Главная']);
        $pages_folder = $em->getRepository('SmartCore\Bundle\CMSBundle\Entity\Folder')->findOneBy(['title'=>'Pages']);
        $blog_folder = $em->getRepository('SmartCore\Bundle\CMSBundle\Entity\Folder')->findOneBy(['title'=>'Blog']);
        $news_folder = $em->getRepository('SmartCore\Bundle\CMSBundle\Entity\Folder')->findOneBy(['title'=>'News']);

        $menu_item = New Item();
        $menu_item->setCreateByUserId($user_id)
            ->setFolder($root_folder)
            ->setTitle('Главная')
            ->setGroup($menu_group)
            ->setIsActive(true)
        ;
        $manager->persist($menu_item);

        $menu_item = New Item();
        $menu_item->setCreateByUserId($user_id)
            ->setFolder($pages_folder)
            ->setTitle('О сайте')
            ->setGroup($menu_group)
            ->setIsActive(true)
        ;
        $manager->persist($menu_item);

        $menu_item = New Item();
        $menu_item->setCreateByUserId($user_id)
            ->setFolder($blog_folder)
            ->setTitle('Блог')
            ->setGroup($menu_group)
            ->setIsActive(true)
        ;
        $manager->persist($menu_item);

        $menu_item = New Item();
        $menu_item->setCreateByUserId($user_id)
            ->setFolder($news_folder)
            ->setTitle('Новости')
            ->setGroup($menu_group)
            ->setIsActive(true)
        ;
        $manager->persist($menu_item);

//        $engineFolder = $this->container->get('cms.folder');
//        $root_folder = $engineFolder->getBy(['title'=>$root_folder->getTitle()]);
//        ld($root_folder->getId());


               $manager->flush();
    }

    /**
     * {@inheritDoc}
     */
    public function getOrder()
    {
        return 4;
    }
}
