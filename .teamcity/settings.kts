package _Self.buildTypes

import jetbrains.buildServer.configs.kotlin.v2018_2.*
import jetbrains.buildServer.configs.kotlin.v2018_2.buildSteps.script
import jetbrains.buildServer.configs.kotlin.v2018_2.triggers.vcs

object TcDummyDeb : BuildType({
    name = "tcDummyDeb"

vcs {
    root(GithubTcDummyDeb)
}

    steps {
        script {
            scriptContent = "./build.sh"
        }
    }

    triggers {
        vcs {
        }
    }
})

object GithubTcDummyDeb : GitVcsRoot({
    name = "GithubTcDummyDeb"
    url = "https://github.com/tcplugins/tcDummyDeb.git"
})
