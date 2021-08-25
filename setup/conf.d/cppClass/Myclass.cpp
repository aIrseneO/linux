#include "Myclass.hpp"

Myclass::Myclass(void) {
	
	return;
}

Myclass::Myclass(Myclass const &other) {
	
	(void)other;
	
	return ;
}

Myclass& Myclass::operator= (Myclass const &other) {
	if (this == &other)
		return (*this);

	return (*this);
}

Myclass::~Myclass(void) {
	
	return;
}

std::ostream& operator<< (std::ostream& out, Myclass const &other) {

	(void)other;

	return (out);
}
