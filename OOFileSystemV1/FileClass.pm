package FileClass;

sub new{
	$class = shift;
	$self = shift{

		filename => shift,
		type => shift,
		path => shift,
		#Path would be <parent directory>/$filename
		
		content => shift,
		#content would be based on what the user inputs
		size => shift
	};
	bless $self, $class;
	return $self;
}

sub setFileName{
	my ($self, $new_filename) = @_;
	$self->{filename} = $new_filename if defined($new_filename);
	return $self->{filename};
}

sub getFileName{
	my ($self) = @_;
	return $self->{filename};
}

sub setType{
	my ($self, $new_type) = @_;
	$self->{type} = $new_type if defined($new_type);
	return $self->{type};
}

sub getType{
	my ($self) = @_;
	return $self->{type};
}

sub setPath{
	my ($self, $new_path) = @_;
	$self->{path} = $new_path if defined($new_path);
	return $self->{path};
}

sub getPath{
	my ($self) = @_;
	return $self->{path};
}


sub setContent{
	my ($self, $new_content) = @_;
	$self->{content} = $new_content if defined($new_content);
	return $self->{content};
}

sub getContent{
	my ($self) = @_;
	return $self->{content};
}

sub setSize{
	my ($self, $new_size) = @_;
	$self->{size} = $new_size if defined($new_size);
	return $self->{size};
}

sub getSize{
	my ($self) = @_;
	return $self->{size};
}
1;