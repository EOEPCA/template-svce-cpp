#include <eoepca/application.h>

namespace EOEPCA {

Application::Application(std::string theId) : id(std::move(theId)) {}

const std::string& Application::getId() const { return id; }
void Application::setId(const std::string& id) { Application::id = id; }

int Application::runOK() { return 0; }
int Application::runNOK() { return 1; }
void Application::runRuntimeError() {
  std::cout << "throw std::runtime_error \n";

  throw std::runtime_error("in throw runtime_error");
}

std::string Application::echo(std::string str) { return std::move(str); }
void Application::show(std::string str) {
  std::cout << std::move(str) << std::endl;
}

}  // namespace EOEPCA
