package grus
import grails.plugin.springsecurity.annotation.Secured
@Secured("permitAll")
class PageController {

    def index() {}
    def contact(){}
}
