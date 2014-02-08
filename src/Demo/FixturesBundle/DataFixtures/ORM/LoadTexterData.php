<?php

namespace Demo\FixturesBundle\ORM;

use Doctrine\Common\DataFixtures\FixtureInterface;
use Doctrine\Common\DataFixtures\OrderedFixtureInterface;
use Doctrine\Common\Persistence\ObjectManager;
use Symfony\Component\DependencyInjection\ContainerAware;
use SmartCore\Module\Texter\Entity\Item;

class LoadTexterData extends ContainerAware implements FixtureInterface, OrderedFixtureInterface
{
    /**
     * {@inheritDoc}
     */
    public function load(ObjectManager $manager)
    {
        $user_id = 1;

        $menu_item = New Item();
        $menu_item->setUserId($user_id)
            ->setText('<p>На этом сайте собраны различная полезная информация по тематике сайтостроения.</p>
<p>Информация больше собрана для себя, впрочем, надеюсь, что она будет также полезна и другим программистам.</p>
<p>Если Вам нужно создать сайт под ключ - свяжитесь со мной через <a href="/contacts/">форму обратной связи</a>.</p>
<p>Данный блог написан на фреймворке <a href="http://symfony.com/" target="_blank">Symfony2</a>.</p>')
        ;
        $manager->persist($menu_item);

        $manager->flush();
    }

    /**
     * {@inheritDoc}
     */
    public function getOrder()
    {
        return 5;
    }
}
