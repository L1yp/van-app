package com.l1yp.model.param.process.model;

import javax.validation.constraints.Min;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;
import java.util.List;

public class AddProcessModelPageSchemeParam {

    @NotNull
    @Min(1)
    public Long processModelPageId;

    public List<PageFieldScheme> h5;
    public List<PageFieldScheme> pad;
    public List<PageFieldScheme> pc;

    public static class PageFieldScheme {

        @NotNull
        public Long fieldId;

        @NotBlank
        public String fieldName;

        @NotBlank
        public String fieldLabel;

        @NotNull
        public Integer orderNo;

        @NotNull
        public Integer span;

        @NotNull
        public Integer writeable;

    }

}
