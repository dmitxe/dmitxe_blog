<?php

namespace Demo\FixturesBundle\ORM;

use Doctrine\Common\DataFixtures\FixtureInterface;
use Doctrine\Common\DataFixtures\OrderedFixtureInterface;
use Doctrine\Common\Persistence\ObjectManager;
use Symfony\Component\DependencyInjection\ContainerAware;
use SmartCore\Module\News\Entity\News;

class LoadNewsData extends ContainerAware implements FixtureInterface, OrderedFixtureInterface
{
    /**
     * {@inheritDoc}
     */
    public function load(ObjectManager $manager)
    {
        $article = new News();
        $article->setTitle('Переезд с шаред-хостинга на VPS')
            ->setSlug('moving_from_shared-hosting_on_vps')
            ->setAnnotation('Наконец-то блог переместился с шаред-хостинга на VPS.')
            ->setText('Наконец-то блог переместился с шаред-хостинга на VPS. По цене получилось примерно тоже самое, но возможностей на VPS гораздо больше. И сайт шустрее работать стал.')
            ->setUpdated(new \DateTime('2013-09-05 09:10:55'))
        ;
        $manager->persist($article);

        $article = new News();
        $article->setTitle('Сайт перешел на фреймворк Symfony2')
            ->setSlug('moving_on_symfony2')
            ->setAnnotation('Свершилось! После месяца интенсивных работ над движком SmartCore мы смогли перевести мой блог на Symfony2.')
            ->setText('Свершилось! После месяца интенсивных работ над движком SmartCore мы смогли перевести мой блог на Symfony2.
            До этого момента блог работал на фреймворке Yii. Yii весьма неплох, но все же было принято решение осваивать Symfony2 и развивать движок SmartCore.Работа над ним и над самим сайтом продолжается. В планах создать функционал, не хуже чем на CMS Wordpress, а так же перевести магазин с CMS Joomla…')
            ->setUpdated(new \DateTime('2013-09-05 11:49:32'))
        ;
        $manager->persist($article);

        $article = new News();
        $article->setTitle('Обновление ядра сайта')
            ->setSlug('site_updating')
            ->setAnnotation('Сайт полностью перешел на CMS SmartCore.')
            ->setText('Сайт полностью перешел на CMS SmartCore. До этого использовались отдельные бандлы из движка, теперь же сайт переписан начисто.
            Былв отключана система комментариев от FOS, вместо них используется Disqus.')
            ->setUpdated(new \DateTime('2014-02-10 13:48:42'))
        ;
        $manager->persist($article);

        $manager->flush();
    }

    /**
     * {@inheritDoc}
     */
    public function getOrder()
    {
        return 6;
    }
}
