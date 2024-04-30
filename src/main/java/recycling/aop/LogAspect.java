package recycling.aop;

import javax.servlet.http.HttpServletRequest;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.Signature;
import org.aspectj.lang.annotation.After;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
@Aspect
public class LogAspect {

	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired HttpServletRequest req;
	@Before("execution(* *..controller..*.*(..))")
	public void defaultControllerLog() {
		logger.info("{} [{}]", req.getRequestURI(), req.getMethod());
	}
	
	@Before("execution(* *..service..*.*(..))")
	public void defaultServiceLog(JoinPoint jp) {
		logger.info("{}", jp.getSignature().toShortString());
	}
}
