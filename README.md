# AlRide - simple ride sharing platform

AlRide is a ride sharing platform that is a simple as is gets.

Anyone may enter ride offers and ride requests, and other people are able to contact
the submitter through a contact form. The email address is not shown to anyone on the
website, but only stored internally. The main view will only show database entries that
are in the future (minus some slack).

Each entry has a random secret assigned that is attached to a removal link which is added
to every mail that is sent to an entry submitter.

Built with Rails4, Bootstrap and HAML.
