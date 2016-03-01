package grus

class UrlMappings {

    static mappings = {
        "/$controller/$action?/$id?(.$format)?"{
            constraints {
                // apply constraints here
            }
        }

        "/"(view:"/page/index")
        "/index"(view:"/page/index")
        "500"(view:'/error')
        "404"(view:'/notFound')
    }
}
