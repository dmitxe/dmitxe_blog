<?php

namespace SmartCore\Module\Feedback\Controller;

use SmartCore\Bundle\CMSBundle\Module\Controller;
use SmartCore\Module\Feedback\Form\Type\FeedbackFormType;
use Symfony\Component\HttpFoundation\Request;

class FeedbackController extends Controller
{
    public function indexAction()
    {
        $form = $this->createForm(new FeedbackFormType());

        $feedback_data = $this->get('session')->getFlashBag()->get('feedback_data');

        if (!empty($feedback_data)) {
            $form->submit(new Request($feedback_data[0]));
            $form->isValid();
        }

        return $this->render('FeedbackModule::feedback.html.twig', [
            'form' => $form->createView(),
        ]);
    }

    public function postAction(Request $request)
    {
        $form = $this->createForm(new FeedbackFormType());
        $form->submit($request);

        $item = $form->getData();

        $session = $this->get('session')->getFlashBag();
        if ($request->isMethod('POST') and $form->isValid()) {
            $em = $this->getDoctrine()->getManager();
            $em->persist($item);
            $em->flush($item);

            $session->add('success', 'Сообщение отправлено.');
        } else {
            $session->add('error', 'При заполнении формы допущены ошибки.');
            $session->add('feedback_data', $request->request->all());
        }

        // @todo FS#380 - Генерация пути к ноде
        return $this->redirect($this->get('cms.folder')->getUri($this->node->getFolderId()));
    }
}
