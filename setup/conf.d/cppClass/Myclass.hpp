#ifndef MYCLASS_HPP
# define MYCLASS_HPP

# include <iostream>

class Myclass {
	private:

	public:
		Myclass(void);
		Myclass(std::string const name);
		Myclass(Myclass const &other);
		Myclass& operator= (Myclass const &other);
		~Myclass(void);
};

std::ostream& operator<< (std::ostream& out, Myclass const &other);

#endif
