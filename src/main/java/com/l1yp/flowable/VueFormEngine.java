package com.l1yp.flowable;

import org.flowable.engine.form.StartFormData;
import org.flowable.engine.form.TaskFormData;
import org.flowable.engine.impl.form.FormEngine;
import org.flowable.form.api.FormDefinition;
import org.flowable.form.engine.impl.persistence.entity.FormResourceEntity;
import org.springframework.beans.BeansException;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;
import org.springframework.stereotype.Component;

import java.util.List;

//@Component
public class VueFormEngine implements FormEngine, ApplicationContextAware {

    @Override
    public String getName() {
        return "vue-form-engine";
    }


    @Override
    public Object renderStartForm(StartFormData startForm) {
        org.flowable.form.engine.FormEngine formEngine = ctx.getBean("formEngine", org.flowable.form.engine.FormEngine.class);
        List<FormDefinition> list = formEngine.getFormRepositoryService().createFormDefinitionQuery().formDefinitionKey(startForm.getFormKey()).orderByFormVersion().desc().list();
        FormDefinition formDefinition = list.get(0);
        String deploymentId = formDefinition.getDeploymentId();
        String resourceName = formDefinition.getResourceName();
        FormResourceEntity formResourceEntity = formEngine.getFormEngineConfiguration().getResourceDataManager().findResourceByDeploymentIdAndResourceName(deploymentId, resourceName);
        System.out.println("formResourceEntity = " + formResourceEntity);
        return null;
    }

    @Override
    public Object renderTaskForm(TaskFormData taskForm) {
        return null;
    }

    ApplicationContext ctx;

    @Override
    public void setApplicationContext(ApplicationContext applicationContext) throws BeansException {
        this.ctx = applicationContext;
    }
}
