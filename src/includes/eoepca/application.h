

#ifndef TEMPLATE_SVCE_CPP
#define TEMPLATE_SVCE_CPP

#include <iostream>
#include <string>

namespace EOEPCA {

class Application {
  std::string id{""};

 public:
  explicit Application(std::string theId);
  Application() = default;
  Application(const Application&) = default;
  Application(Application&&) = default;

  ~Application() = default;

 public:
  const std::string& getId() const;
  void setId(const std::string& id);

 public:
  int runOK();
  int runNOK();
  void runRuntimeError();

  std::string echo(std::string str) ;
  void show(std::string str) ;
};

}  // namespace EOEPCA

#endif  // TEMPLATE_SVCE_CPP
