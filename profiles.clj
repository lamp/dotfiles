{:user {:plugins [[cider/cider-nrepl "0.21.1" :exclusions [org.clojure/tools.nrepl]]
                  [refactor-nrepl "2.4.0" :exclusions [cider/cider-nrepl]]
                  [lein-figwheel "0.5.18"]]
        :dependencies [[vvvvalvalval/scope-capture "0.2.0"]
                       [nrepl "0.4.0"]
                       [com.gfredericks/debug-repl "0.0.10"]
                       [com.cemerick/pomegranate "1.1.0" :exclusions [org.clojure/clojure
                                                                      org.apache.maven/maven-artifact
                                                                      com.google.guava/guava]]
                       [cider/piggieback "0.4.0"]
                       ; [figwheel-sidecar "0.5.18"]
                       [kaocha-nrepl "0.1.1"]]
        :injections [(require 'sc.api) (require '[clojure.repl :refer :all])]
        :nrepl-middleware [com.gfredericks.debug-repl/wrap-debug-repl 
                           kaocha-nrepl.core/wrap-kaocha]}}
        ; :repl-options {:nrepl-middleware [cider.piggieback/wrap-cljs-repl]}}}
        
