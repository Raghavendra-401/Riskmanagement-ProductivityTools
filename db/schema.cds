namespace riskmanagement;

using { Sap_API_Hub_S4HANACLOUD } from '../srv/external/Sap_API_Hub_S4HANACLOUD.cds';

using
{
    Country,
    Currency,
    Language,
    User,
    cuid,
    managed,
    temporal
}
from '@sap/cds/common';

entity Risks
{
    key ID : UUID;
    title : String(100);
    priority : String(5);
    description : String(100);
    impact : Integer;
    criticality : Integer;
    miti : Association to one Mitigations;
    supplier : Association to one Sap_API_Hub_S4HANACLOUD.A_BusinessPartner;
}

entity Mitigations
{
    key ID : UUID;
    CreatedAt : String(100);
    CreatedBy : String(100);
    description : String(100);
    owner : String(100);
    timeline : String(100);
    risks : Association to many Risks on risks.miti = $self;
}
