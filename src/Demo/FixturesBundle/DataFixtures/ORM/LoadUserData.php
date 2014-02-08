<?php

namespace Demo\FixturesBundle\ORM;

use Doctrine\Common\DataFixtures\FixtureInterface;
use Doctrine\Common\DataFixtures\OrderedFixtureInterface;
use Doctrine\Common\Persistence\ObjectManager;
use Symfony\Component\DependencyInjection\ContainerAware;
use SmartCore\Bundle\FOSUserBundle\Entity\User;
use SmartCore\Bundle\FOSUserBundle\Entity\Group;

class LoadUserData extends ContainerAware implements FixtureInterface, OrderedFixtureInterface
{
    /**
     * {@inheritDoc}
     */
    public function load(ObjectManager $manager)
    {
        $encoder = $this->container->get('security.encoder_factory')->getEncoder(new User());

        $group_blogger = new Group('blogger', ['ROLE_BLOGGER']);
        $manager->persist($group_blogger);

        $group_admin = new Group('admin', ['ROLE_ADMIN']);
        $manager->persist($group_admin);

        $group_root = new Group('syperadmin', ['ROLE_ROOT']);
        $manager->persist($group_admin);

        $user = new User();
        $user->setUsername('admin')
            ->setPassword($encoder->encodePassword('sdhfgthhrj26465g', $user->getSalt()))
            ->setEmail('XeDmitry@yandex.ru')
            ->setEnabled(true) // @todo убрать на продакшине.
            ->setSuperAdmin(true);
        $manager->persist($user);

        $user = new User();
        $user->setUsername('root')
            ->setPassword($encoder->encodePassword('123', $user->getSalt()))
            ->setEmail('root@mail.ru')
            ->setEnabled(true) // @todo убрать на продакшине.
//            ->addGroup($group_root);
            ->setSuperAdmin(true);
        $manager->persist($user);

        $user = new User();
        $user->setUsername('tester')
            ->setPassword($encoder->encodePassword('123', $user->getSalt()))
            ->setEmail('tester@mail.ru')
            ->setEnabled(true) // @todo убрать на продакшине.
            ->setRoles(['ROLE_USER']);
//            ->addGroup($group_blogger);
        $manager->persist($user);

        $manager->flush();
    }

    /**
     * {@inheritDoc}
     */
    public function getOrder()
    {
        return 1;
    }
}
