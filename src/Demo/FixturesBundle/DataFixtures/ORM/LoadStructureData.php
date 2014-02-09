<?php

namespace Demo\FixturesBundle\ORM;

use Doctrine\Common\DataFixtures\FixtureInterface;
use Doctrine\Common\DataFixtures\OrderedFixtureInterface;
use Doctrine\Common\Persistence\ObjectManager;
use Symfony\Component\DependencyInjection\ContainerAware;
use SmartCore\Bundle\CMSBundle\Entity\Block;
use SmartCore\Bundle\CMSBundle\Entity\Folder;
use SmartCore\Bundle\CMSBundle\Entity\Node;
//use SmartCore\Module\Menu\Entity\Group as GroupMenu;
//use SmartCore\Module\Menu\Entity\Item;

class LoadStructureData extends ContainerAware implements FixtureInterface, OrderedFixtureInterface
{
    /**
     * {@inheritDoc}
     */
    public function load(ObjectManager $manager)
    {
        $user_id = 1;
        $em = $this->container->get('doctrine.orm.default_entity_manager');
        $root_folder = new Folder();
        $root_folder->setTitle('Главная')
            ->setCreateByUserId( $user_id)
            ->setDescr('Корневая папка')
            ->setPosition(0)
            ->setHasInheritNodes(true)
        ;
        $manager->persist($root_folder);

        $manager->flush();
        $root_folder = $em->getRepository('SmartCore\Bundle\CMSBundle\Entity\Folder')->findOneBy(['title'=>'Главная']);

        $content_block = new Block();
        $content_block->setName('content')
            ->setDescr('Рабочая область')
            ->setPosition(0);
        $manager->persist($content_block);

        $mainmenu_block = new Block();
        $mainmenu_block->setName('main_menu')
            ->setDescr('Главное меню')
            ->setPosition(1)
            ->setFolder($root_folder)
        ;
        $manager->persist($mainmenu_block);

        $leftsidebar_block = new Block();
        $leftsidebar_block->setName('left_sidebar')
            ->setDescr('Левый сайдбар')
            ->setPosition(2)
            ->setFolder($root_folder);
        $manager->persist($leftsidebar_block);

        $breadcrumbs_block = new Block();
        $breadcrumbs_block->setName('breadcrumbs')
            ->setDescr('Хлебные крошки')
            ->setPosition(3)
            ->setFolder($root_folder)
        ;
        $manager->persist($breadcrumbs_block);

        $footer_block = new Block();
        $footer_block->setName('footer')
            ->setDescr('Подвал')
            ->setPosition(4)
            ->setFolder($root_folder)
        ;
        $manager->persist($footer_block);

        $manager->flush();

        $menu_node = new Node();
        $menu_node->setModule('Menu')
            ->setBlock($mainmenu_block)
            ->setFolder($root_folder)
            ->setDescr('Главное меню')
            ->setIsActive(true)
            ->setIsCached(false)
            ->setParams([
                'depth'=>0.0,
                'group_id'=>1,
                'css_class'=>'nav',
                'selected_inheritance'=>false
            ])
        ;
        $manager->persist($menu_node);

        $breadcrumbs_node = new Node();
        $breadcrumbs_node->setModule('Breadcrumbs')
            ->setBlock($breadcrumbs_block)
            ->setFolder($root_folder)
            ->setDescr('Хлебные крошки')
            ->setIsActive(true)
            ->setIsCached(false)
            ->setParams([
                'delimiter'=>'»',
                'hide_if_only_home'=>true,
            ])
        ;
        $manager->persist($breadcrumbs_node);

        /*       $menu_group = New GroupMenu();
               $menu_group->setCreateByUserId($user_id)
                   ->setName('Главное меню');*/

//        ld($root_folder->getId());
        $blog_folder = new Folder();
        $blog_folder->setTitle('Blog')
            ->setDescr('Папка блога')
            ->setParentFolder($root_folder)
            ->setHasInheritNodes(false)
            ->setUriPart('blog')
        ;
        $manager->persist($blog_folder);

        $news_folder = new Folder();
        $news_folder->setTitle('News')
            ->setDescr('Папка новостей')
            ->setParentFolder($root_folder)
            ->setHasInheritNodes(false)
            ->setUriPart('news')
        ;
        $manager->persist($news_folder);

        $page_about_folder = new Folder();
        $page_about_folder->setTitle('About Us')
            ->setDescr('О сайте')
            ->setParentFolder($root_folder)
            ->setHasInheritNodes(false)
            ->setUriPart('about')
        ;
        $manager->persist($page_about_folder);

        $feedback_folder = new Folder();
        $feedback_folder->setTitle('Feedback')
            ->setDescr('О сайте')
            ->setParentFolder($root_folder)
            ->setHasInheritNodes(false)
            ->setUriPart('feedback')
        ;
        $manager->persist($feedback_folder);

        $manager->flush();

        $blog_folder = $em->getRepository('SmartCore\Bundle\CMSBundle\Entity\Folder')->findOneBy(['title'=>'Blog']);
        $news_folder = $em->getRepository('SmartCore\Bundle\CMSBundle\Entity\Folder')->findOneBy(['title'=>'News']);
        $page_about_folder = $em->getRepository('SmartCore\Bundle\CMSBundle\Entity\Folder')->findOneBy(['title'=>'About Us']);
        $feedback_folder = $em->getRepository('SmartCore\Bundle\CMSBundle\Entity\Folder')->findOneBy(['title'=>'Feedback']);

        $blog_node = new Node();
        $blog_node->setModule('Blog')
            ->setBlock($content_block)
            ->setFolder($blog_folder)
            ->setDescr('Блог')
            ->setIsActive(true)
            ->setIsCached(false)
        ;
        $manager->persist($blog_node);

        $manager->flush();
        $blog_node = $em->getRepository('SmartCore\Bundle\CMSBundle\Entity\Node')->findOneBy(['descr'=>'Блог']);
        $blog_folder->setRouterNodeId($blog_node->getId());
        $manager->persist($blog_folder);


        $widget_blog_category_node = new Node();
        $widget_blog_category_node->setModule('Widget')
            ->setBlock($leftsidebar_block)
            ->setFolder($root_folder)
            ->setDescr('Категории блога')
            ->setIsActive(true)
            ->setIsCached(false)
            ->setParams([
                'node_id'=>$blog_node->getId(),
                'controller'=>'BlogWidget:categoryTree',
                'open_tag'=>'
                <div class="portlet-decoration">
                    <div class="portlet-title">Рубрики блога</div>
                </div>
                <div class="portlet-content">',
                'close_tag'=>'</div>'
            ])
        ;
        $manager->persist($widget_blog_category_node);

        $widget_blog_archive_node = new Node();
        $widget_blog_archive_node->setModule('Widget')
            ->setBlock($leftsidebar_block)
            ->setFolder($root_folder)
            ->setDescr('Архив блога')
            ->setIsActive(true)
            ->setIsCached(false)
            ->setParams([
                'node_id'=>$blog_node->getId(),
                'controller'=>'BlogWidget:archiveMonthly',
                'open_tag'=>'
                <div class="portlet-decoration">
                    <div class="portlet-title">Архив статей</div>
                </div>
                <div class="portlet-content">',
                'close_tag'=>'</div>'
            ])
        ;
        $manager->persist($widget_blog_archive_node);

        $widget_blog_tag_node = new Node();
        $widget_blog_tag_node->setModule('Widget')
            ->setBlock($leftsidebar_block)
            ->setFolder($root_folder)
            ->setDescr('Облако тегов')
            ->setIsActive(true)
            ->setIsCached(false)
            ->setParams([
                'node_id'=>$blog_node->getId(),
                'controller'=>'BlogWidget:tagCloud',
                'open_tag'=>'
                <div class="portlet-decoration">
                    <div class="portlet-title">Тэги блога</div>
                </div>
                <div class="portlet-content">',
                'close_tag'=>'</div>'
            ])
        ;
        $manager->persist($widget_blog_tag_node);

        $news_node = new Node();
        $news_node->setModule('News')
            ->setBlock($content_block)
            ->setFolder($news_folder)
            ->setDescr('Новости')
            ->setIsActive(true)
            ->setIsCached(false)
        ;
        $manager->persist($news_node);

        $manager->flush();
        $news_node = $em->getRepository('SmartCore\Bundle\CMSBundle\Entity\Node')->findOneBy(['descr'=>'Новости']);
        $news_folder->setRouterNodeId($news_node->getId());
        $manager->persist($news_folder);

        $page_about_node = new Node();
        $page_about_node->setModule('Texter')
            ->setBlock($content_block)
            ->setFolder($page_about_folder)
            ->setDescr('О сайте')
            ->setIsActive(true)
            ->setIsCached(false)
            ->setParams([
                'text_item_id'=>1,
                'editor'=>true
            ])
        ;
        $manager->persist($page_about_node);

        $feedback_node = new Node();
        $feedback_node->setModule('Feedback')
            ->setBlock($content_block)
            ->setFolder($feedback_folder)
            ->setDescr('Обратная связь')
            ->setIsActive(true)
            ->setIsCached(false)
        ;
        $manager->persist($feedback_node);

        $manager->flush();
    }

    /**
     * {@inheritDoc}
     */
    public function getOrder()
    {
        return 3;
    }
}
