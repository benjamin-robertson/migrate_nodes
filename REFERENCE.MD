# Reference

<!-- DO NOT EDIT: This document was generated by Puppet Strings -->

## Table of Contents

### Tasks

* [`check_pe_connection`](#check_pe_connection): Confirms if a PE server is accessible from a node
* [`clear_ssl_certs`](#clear_ssl_certs): Clears SSL certs from Puppet agent; deletes cert and restart
* [`confirm_primary_server`](#confirm_primary_server): Task to verify if the server its running on is in fact the Puppet Primary server
* [`set_csr_attributes`](#set_csr_attributes): Merges existing trusted fact
* [`set_long_paths_windows`](#set_long_paths_windows): Enable long path support on Windows 2016 or later

### Plans

* [`migrate_nodes::migrate_node`](#migrate_nodesmigrate_node): PE plan to migrate nodes to another PE server

## Tasks

### <a name="check_pe_connection"></a>`check_pe_connection`

Confirms if a PE server is accessible from a node

**Supports noop?** false

#### Parameters

##### `target_pe_server`

Data type: `String[1]`

PE server to check connection to

##### `bypass_connectivity_check`

Data type: `Boolean`

Bypass connectivity check, still checks for PE server

### <a name="clear_ssl_certs"></a>`clear_ssl_certs`

Clears SSL certs from Puppet agent; deletes cert and restart

**Supports noop?** true

#### Parameters

##### `noop`

Data type: `Boolean`

noop workaround parameter

### <a name="confirm_primary_server"></a>`confirm_primary_server`

Task to verify if the server its running on is in fact the Puppet Primary server

**Supports noop?** false

#### Parameters

##### `pe_primary_server`

Data type: `String`

Puppet Primary server hostname

##### `ignore_infra_status_error`

Data type: `Boolean`

Ignore puppet infra status stderr

### <a name="set_csr_attributes"></a>`set_csr_attributes`

Merges existing trusted fact

**Supports noop?** false

#### Parameters

##### `trusted_facts`

Data type: `Hash`

Trusted facts to add

##### `preserve_existing_facts`

Data type: `Boolean`

Preserve existing trusted facts

### <a name="set_long_paths_windows"></a>`set_long_paths_windows`

Enable long path support on Windows 2016 or later

**Supports noop?** true

## Plans

### <a name="migrate_nodesmigrate_node"></a>`migrate_nodes::migrate_node`

lint:ignore:140chars

#### Parameters

The following parameters are available in the `migrate_nodes::migrate_node` plan:

* [`origin_pe_primary_server`](#origin_pe_primary_server)
* [`target_pe_address`](#target_pe_address)
* [`targets`](#targets)
* [`fact_name`](#fact_name)
* [`fact_value`](#fact_value)
* [`noop`](#noop)
* [`bypass_connectivity_check`](#bypass_connectivity_check)
* [`ignore_infra_status_error`](#ignore_infra_status_error)

##### <a name="origin_pe_primary_server"></a>`origin_pe_primary_server`

Data type: `String`

Puppet Primary server the node is being migrated from. Must match Primary server FQDN(Certname). Use to purge migrated nodes.

##### <a name="target_pe_address"></a>`target_pe_address`

Data type: `Variant[String,Array]`

Target Puppet server, either compiler address or FQDN of Primary server. Use array to specific multiple compilers.

##### <a name="targets"></a>`targets`

Data type: `Optional[TargetSpec]`

The targets to run on (note this must match the certnames used by Puppet / shown in PE console).
NOTE: you may ONLY specify target or fact_value. Specifying both will cause the plan to fail.

Default value: ``undef``

##### <a name="fact_name"></a>`fact_name`

Data type: `Optional[String]`

Fact name to match nodes by.

Default value: ``undef``

##### <a name="fact_value"></a>`fact_value`

Data type: `Optional[String]`

Fact value the fact must match.
NOTE: you may ONLY specify target or fact_value. Specifying both will cause the plan to fail.

Default value: ``undef``

##### <a name="noop"></a>`noop`

Data type: `Boolean`

Run the plan in noop mode. Make no changes.

Default value: ``false``

##### <a name="bypass_connectivity_check"></a>`bypass_connectivity_check`

Data type: `Boolean`

Do not check for connectivity to target PE server.

Default value: ``false``

##### <a name="ignore_infra_status_error"></a>`ignore_infra_status_error`

Data type: `Boolean`



Default value: ``false``

