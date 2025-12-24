import { Input, Component } from '@angular/core';
import { Api } from '../../providers/api/api';

@Component({
  selector: 'value-look-up',
  templateUrl: 'value-look-up.html'
})
export class ValueLookUpComponent {

  text!: string;
  @Input() entityID: any; //actual ID for which we need record..
  @Input()
  entityObject!: String;//Subject as value or name of entiry
  @Input() entityKeyName: any;//example.. it would be SubjectID
  @Input() lookupFieldName: any;//target field name  which will display the like SubjectName
  @Input() lookupFieldName1: any;
  @Input() lookupFieldName2: any;

  constructor(public api: Api) {
  }
  ngOnInit() {
    let url = this.entityObject + "Select?";
    let params = "tenantID="+this.api.getTenantID()+"&"
      + this.entityKeyName + "=" + this.entityID
      + "&secureCode=1";

    this.api.getPlainUrl(url + params)
      .subscribe((resp: any) => {
        // console.log(resp);
        if (resp != null) {
          if (resp.Status == 'Success') {
            //console.log(this.lookupFieldName);
            if (this.lookupFieldName2)
              this.text = resp.Result[0][this.lookupFieldName] + " " + resp.Result[0][this.lookupFieldName1] + " " + resp.Result[0][this.lookupFieldName2];
            else if (this.lookupFieldName1)
              this.text = resp.Result[0][this.lookupFieldName] + " " + resp.Result[0][this.lookupFieldName1]
            else
              this.text = resp.Result[0][this.lookupFieldName];
          }
        }
      },
        error => console.log(error.message));

  }
}
