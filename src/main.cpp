
#include <eoepca/application.h>

#include <memory>

/***
 * main Application
 * @param argc
 * @param argv
 * @return
 */
int main(int argc, char** argv) {
  auto application = std::make_unique<EOEPCA::Application>();

  application->show(application->echo("EOEPCA Hello World\n"));

  return 0;
}