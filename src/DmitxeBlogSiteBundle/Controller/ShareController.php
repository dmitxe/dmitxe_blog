<?php

namespace DmitxeBlogSiteBundle\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\Controller;

class ShareController extends Controller
{
    public function indexAction($url)
    {
        return $this->render('SiteBundle:Share:index.html.twig', ['url' => $url]);
    }
}
