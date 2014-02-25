define nfs::server::export::configure (
  $ensure = 'present',
  $clients
) {

  if is_array($clients) {
    $clients_real = join($clients, " ")
  }else {
    $clients_real = $clients
  }

  if $ensure != 'absent' {
    $line = "${name} ${clients_real}\n"

    concat::fragment{
      "${name}":
        target  => '/etc/exports',
        content => "${line}"
    }
  }
}
