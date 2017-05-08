#!groovy
stage "Trigger Downstream Build"
try {
  build job: "../facepalm/${env.BRANCH_NAME}", wait: false
} catch (e) {
  // Ignoring
}
