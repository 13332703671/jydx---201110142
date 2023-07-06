package pers.oneice.ssm.crud.controller;

import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseBody;
import pers.oneice.ssm.crud.exception.BusinessException;
import pers.oneice.ssm.crud.pojo.ErrorCodeEnum;
import pers.oneice.ssm.crud.pojo.Msg;

/**
 * 处理异常, 返回适当的错误信息给客户端
 * @author OneIce
 * @since 2021/3/29 18:46
 */
@ControllerAdvice
public class ExceptionController {

    @ExceptionHandler(BusinessException.class)
    @ResponseBody
    public Msg handlerBusinessException(BusinessException e) {
        return new Msg(e.getErrorCodeEnum());
    }


    @ExceptionHandler(Throwable.class)
    @ResponseBody
    public Msg handlerError() {
        return new Msg(ErrorCodeEnum.SYSTEM_EXECUTION_ERROR);
    }
}
