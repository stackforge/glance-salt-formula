==============
Glance Formula
==============

Install and configure the OpenStack Glance service.

.. note::
    See the full `Salt Formulas installation and usage instructions
    <http://docs.saltstack.com/en/latest/topics/development/conventions/formulas.html>`_.

Available states
================

.. contents::
    :local:

``glance``
----------

Install the Glance and enable the service.

``glance.db``
-------------

Create the db for Glance service.

``glance.keystone``
-------------------

Init the glance user, service and endpoint.

``glance.server``
-----------------

Install the Glance and enable the service.

``glance.client``
-----------------

Install the python-glanceclient package.
